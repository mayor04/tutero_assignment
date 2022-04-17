import 'package:flutter/material.dart';

class MousePainter extends CustomPainter {
  Color bgColor;
  MousePainter(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.02621877, size.height * 0.9617476);
    path_0.lineTo(size.width * 0.1443609, size.height * 0.5038438);
    path_0.lineTo(size.width * 0.1466928, size.height * 0.4948057);
    path_0.lineTo(size.width * 0.1443199, size.height * 0.4857941);
    path_0.lineTo(size.width * 0.02641290, size.height * 0.03803412);
    path_0.lineTo(size.width * 0.9500283, size.height * 0.4951293);
    path_0.lineTo(size.width * 0.02621877, size.height * 0.9617476);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = bgColor;
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.05282562, size.height * 0.07606797);
    path_1.lineTo(size.width * 0.1630661, size.height * 0.4947136);
    path_1.lineTo(size.width * 0.05243775, size.height * 0.9234950);
    path_1.lineTo(size.width * 0.9000567, size.height * 0.4953607);
    path_1.lineTo(size.width * 0.05282562, size.height * 0.07606797);
    path_1.moveTo(0, 0);
    path_1.lineTo(size.width, size.height * 0.4948977);
    path_1.lineTo(0, size.height);
    path_1.lineTo(size.width * 0.1303197, size.height * 0.4948977);
    path_1.lineTo(0, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xfffefefe).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
