import 'package:flutter/material.dart';

enum Flip { up, down }

class Customshape extends CustomClipper<Path> {
  Flip flip;
  Customshape(this.flip);
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    if (flip == Flip.up) {
      path.moveTo(0, (height / 2) + 5);
      path.arcToPoint(Offset(5, (height / 2)),
          radius: const Radius.circular(5));
      path.lineTo(width - 5, height / 2);
      path.arcToPoint(Offset(width, (height / 2) + 5),
          radius: const Radius.circular(5));
      path.lineTo(width, height);
      path.lineTo(0, height);

      path.close();
    } else {
      path.moveTo(0, 0);

      path.lineTo(width, 0);
      path.lineTo(width, height / 2 - 5);
      path.arcToPoint(Offset(width - 5, (height / 2)),
          radius: const Radius.circular(5));

      path.lineTo(5, height / 2);
      path.arcToPoint(Offset(0, (height / 2) - 5),
          radius: const Radius.circular(5));

      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BoxShadowPainter extends CustomPainter {
  Flip flip;
  BoxShadowPainter(this.flip);
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    if (flip == Flip.up) {
      path.moveTo(2, (height / 2));
      path.arcToPoint(Offset(5, (height / 2) - 6),
          radius: const Radius.circular(5));
      path.lineTo(width, (height / 2) - 6);
      path.arcToPoint(Offset(width + 3, (height / 2)),
          radius: const Radius.circular(5));
      path.lineTo(width + 3, height);
      path.lineTo(0, height);

      path.close();
    } else {
      path.moveTo(0, 0);

      path.lineTo(width + 5, 0);
      path.lineTo(width + 5, height / 2 - 5);
      path.arcToPoint(Offset(width - 5, (height / 2)),
          radius: const Radius.circular(5));

      path.lineTo(5, height / 2);
      path.arcToPoint(Offset(0, (height / 2) - 5),
          radius: const Radius.circular(5));

      path.close();
    }
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey.shade900
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(10)));
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
