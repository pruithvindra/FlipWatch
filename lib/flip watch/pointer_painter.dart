import 'package:flutter/material.dart';

class PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff8A0202)
      ..style = PaintingStyle.fill
      ..strokeWidth = 7.47;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width / 2, 0);
    path0.lineTo(size.width, size.width / 2);
    path0.lineTo(size.width / 2, size.width);
    path0.lineTo(0, size.width);
    // path0.lineTo(size.width * 0.4175000, size.height * 0.2157143);
    // path0.lineTo(size.width * 0.3741667, size.height * 0.2128571);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
