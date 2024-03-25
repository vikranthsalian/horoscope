import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.moveTo(0, size.height); // starting point (bottom-left corner)
    path.lineTo(size.width, size.height); // horizontal line (bottom side)
    path.lineTo(0, 0); // vertical line (left side)
    path.close(); // close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
